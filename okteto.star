load("encoding/base64.star", "base64")
load("render.star", "render")

OKTETO_IMAGE = base64.decode("""
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
""")

OKTETO_IMAGE_LOGO = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAhGVYSWZNTQAqAAAACAAFARIAAwAAAAEAAQAAARoABQAAAAEAAABKARsABQAAAAEAAABSASgAAwAAAAEAAgAAh2kABAAAAAEAAABaAAAAAAAAAEgAAAABAAAASAAAAAEAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAEaADAAQAAAABAAAAEQAAAAB9qf4CAAAACXBIWXMAAAsTAAALEwEAmpwYAAABWWlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNi4wLjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgoZXuEHAAAC0ElEQVQ4EaVUS0hUURj+zn06I453Bh+BRGkLyR4qxNCmfWAEYdCDLEi3IW2ioAdJi2gRRNsMc0IyioQQ2laLwo1WJASlteg1yXjVyXHu6/SdO+oqKujA5T7O/3/n/7/v+6/A2pJShxAhXj9PQ9q9fO6CjNoA0QDIPN+nITGOyLyFzk4Xa/HMFzGGlBqDIryZOIYIN+HUOvB8oFyG8H1I0wRsG7B4dxdcaDiFHdm7BIrzxDri1MRFZJzLWCqqRE8KocE0GcQUENoPIhGGkoAmUjVAwb2EjuyAyq9UMvWyB5nMMObdgB8FLEtXVVTl56AXlxElqrDSWAeZTLA6L2QDkgcaWHB7VEUCk5MONH8Whs4WghC2qSc+fEJtbgz6/Tur/QLB3oMonuxGcXsr2GoIw9ARhi5EucUgQJ/iQBTmfWnbZvL9LNL7+9mBB+/MOfjNG2F8zcMaeAjnyRFow0NY3NWui3LZl5m0Q456DR7VpUiUui64gdTwIwL4WLx3HUvt2/gsWb1AItsB59ogSTYALWZBgKQrFTVy0Kb6h2lo9vcf0B/k4J3trQAodVZ4lVZQ2rIJc1f6ITVyTZ6kYWjkh2fIrWReNCgZuTT9ZynmwN/cpDZJn4yT1KYqKPluBplDR5H48g3kUBMeQSAbCSLzsQ8oY1idULEwP36OW6DMEFGkIPgOLLe2oDA6glLTBjIdRNKy1E6etWnTsZHog3JjPcLuHlhXb6Pm1dvYYCQbkhIrxerO34hBZXUSIggj2AShkxUn48qJPDFSCYsnDhDcQOrwadQPjcJ5+gJ1I2NI77sA/dljJgesWdXLopWTOQpidVZmqLuyeuyTJE9N/c0npqmzJZez1FxxrJqZWicXOzaiY+1/dGyhcBwdu3N/nh2Ls0PVeFVmR7VsGhZqfjc7/z3FiiK11v4PlVnqi52sjLj+P6GKSgRRHsTOPfPr8Uz9BYEWeX1+kiD3AAAAAElFTkSuQmCC
""")

def main():
     return render.Root(
            child = render.Box(
                render.Row(
                    expanded = True,
                    main_align = "space_evenly",
                    cross_align = "center",
                    children=[
                        render.Image(src = OKTETO_IMAGE_LOGO),
                        render.Column(
                            children=[
                            render.WrappedText(
                                content="WELCOME TO THE", 
                                color="#FFF", 
                                align="left",
                                font=""),
                            render.WrappedText(
                                content="okteto up", 
                                color="#00D1CA", 
                                align="left",
                                font=""),
                            render.WrappedText(
                                content="CLUB!", 
                                color="#FFF", 
                                align="left",
                                font=""),
                            ],
                            
                        )
                        
                    ]
                )
            )
     )